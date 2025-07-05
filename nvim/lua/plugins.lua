return {
--THEME
  {"EdenEast/nightfox.nvim"},
--TELESCOPE
  {'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
--TREESITTER
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
--NEOTREE
  {"nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        }
      }
    }
  },

--NVIMNIO
  {"nvim-neotest/nvim-nio"},
--DAP-PYTHON
  {'mfussenegger/nvim-dap-python'},
--Debugging
  {"mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui"
  },
  config = function ()
    local dap = require("dap")
    local dapui =  require("dapui")

    require("dap-python").setup()  
    require("dapui").setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<Leader>dt',dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<Leader>dc',dap.continue,{})
  end,
  }


}
