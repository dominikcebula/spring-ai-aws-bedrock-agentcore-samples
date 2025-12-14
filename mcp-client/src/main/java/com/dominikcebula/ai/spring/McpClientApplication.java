package com.dominikcebula.ai.spring;

import io.modelcontextprotocol.client.McpSyncClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.List;

import static io.modelcontextprotocol.spec.McpSchema.ListToolsResult;

@SpringBootApplication
public class McpClientApplication implements CommandLineRunner {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    public static void main(String[] args) {
        SpringApplication.run(McpClientApplication.class, args);
    }

    private final List<McpSyncClient> mcpClients;

    public McpClientApplication(List<McpSyncClient> mcpClients) {
        this.mcpClients = mcpClients;
    }

    @Override
    public void run(String... args) throws Exception {
        log.info("MCP Client started!");

        mcpClients.forEach(this::dumpInfo);
    }

    private void dumpInfo(McpSyncClient client) {
        log.info("Dumping MCP Client info:");
        log.info("Server Info: {}", client.getServerInfo());
        log.info("Server Capabilities {}", client.getServerCapabilities());
        log.info("Client Capabilities {}", client.getClientCapabilities());

        ListToolsResult listToolsResult = client.listTools();

        while (listToolsResult != null) {
            listToolsResult.tools().forEach(tool -> log.info("Tool: {}", tool));

            String nextCursor = listToolsResult.nextCursor();
            if (nextCursor != null)
                listToolsResult = client.listTools(nextCursor);
            else
                listToolsResult = null;
        }
    }
}
