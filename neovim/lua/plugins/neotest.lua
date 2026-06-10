return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
    "Issafalcon/neotest-dotnet",
    "olimorris/neotest-rspec",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-jest",
  },
  -- Atalhos configurados via Lazy para evitar conflitos de carregamento
  keys = {
    { "<leader>t", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
    { "<leader>T", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File Test" },
    { "<leader>o", function() require("neotest").output.open({ enter = true }) end, desc = "Open Test Output" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Test Summary" },
  },
  config = function()
    require("neotest").setup({
      diagnostic = {
        enabled = true,
        severity = vim.diagnostic.severity.HINT,
      },
      adapters = {
        require("neotest-dotnet"),
        require("neotest-rust"),
        require("neotest-go"),
        require("neotest-jest"),
        -- Configuração explícita para forçar o RSpec a ler a estrutura Rails
        require("neotest-rspec")({
          rspec_cmd = function()
            return { "bundle", "exec", "rspec" }
          end,
          root_files = { "Gemfile", ".rspec" },
        }),
      }
    })
  end
}
