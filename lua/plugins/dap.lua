return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
    },
    keys = {
      { "<F5>",       function() require("dap").toggle_breakpoint() end, desc = "breakpoint" },
      { "<F6>",       function() require("build_and_debug").run() end,   desc = "DAP" },
      { "<F7>",       function() require("dap").continue() end,          desc = "DAP continue" },
      { "<leader>di", function() require("dap").step_into() end,         desc = "DAP into" },
      { "<leader>do", function() require("dap").step_out() end,          desc = "DAP out" },
      { "<leader>ds", function() require("dap").step_over() end,         desc = "DAP over" },
      { "<leader>dr", function() require("dap").repl.toggle() end,       desc = "DAP repl" },
      { "<leader>dt", function() require("dap").terminate() end,         desc = "DAP end" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end,  desc = "DAP widgets" },
    },
    config = function()
      local dap = require("dap")

      dap.adapters.cppdbg = {
        type = 'executable',
        id = 'cppdbg',
        command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
      }
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.getcwd() .. '/' .. vim.fn.expand('%:r')
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = true,
          setupCommands = {
            {
              text = '-enable-pretty-printing',
              description = 'enable pretty printing',
              ignoreFailures = false
            },
          },
        },
      }
      dap.configurations.c = dap.configurations.cpp

      local M = {}
      function M.run()
        local ext = vim.fn.expand("%:e")
        local basename = vim.fn.expand("%:r")
        local compiler = (ext == "cpp") and "g++" or "gcc"
        local cmd = string.format("%s -g %s -o %s", compiler, vim.fn.expand("%"), basename)
        print("🛠 Building: " .. cmd)
        local result = os.execute(cmd)
        if result == 0 then
          dap.run(dap.configurations.cpp[1])
        else
          print("❌ Build failed!")
        end
      end

      package.loaded["build_and_debug"] = M
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    keys = {
      { "<F8>", function() require("dapui").toggle() end, desc = "DAP UI" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end
  }
}
