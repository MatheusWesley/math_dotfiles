return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Encontrar arquivo de plugin",
      },
      {
        ";;",
        function()
          require("telescope.builtin").find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Listar arquivos no diretório atual, respeita .gitignore",
      },
      {
        ";r", -- Atalho para busca ao vivo
        function()
          require("telescope.builtin").live_grep({
            additional_args = { "--hidden" },
          })
        end,
        desc = "Buscar uma string no diretório atual e ver os resultados em tempo real",
      },
      {
        "\\\\",
        function()
          require("telescope.builtin").buffers({})
        end,
        desc = "Listar buffers abertos",
      },
      {
        ";t",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Listar tags de ajuda disponíveis e abrir a ajuda correspondente",
      },
      {
        ";p",
        function()
          require("telescope.builtin").resume()
        end,
        desc = "Retomar o último picker do Telescope",
      },
      {
        ";e",
        function()
          require("telescope.builtin").diagnostics()
        end,
        desc = "Listar diagnósticos de todos os buffers abertos ou de um buffer específico",
      },
      {
        ";s",
        function()
          require("telescope.builtin").treesitter()
        end,
        desc = "Listar nomes de funções e variáveis usando Treesitter",
      },
      {
        "sf",
        function()
          local telescope = require("telescope")
          local cwd = vim.loop.cwd()

          telescope.extensions.file_browser.file_browser({
            cwd = cwd,
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Abrir navegador de arquivos no diretório do buffer atual",
      },
    },
    config = function(_, opts) -- Função de configuração do Telescope
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = telescope.extensions.file_browser.actions

      opts = opts or {}

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, { -- Configurações padrão
        wrap_results = true, -- Quebra os resultados em múltiplas linhas
        layout_strategy = "vertical", -- Define o layout como vertical
        layout_config = { prompt_position = "top" }, -- Posição do prompt no topo
        sorting_strategy = "ascending", -- Ordenação ascendente
        winblend = 0, -- Transparência da janela
        mappings = {
          n = {}, -- Mapeamentos no modo normal
        },
      })
      opts.pickers = { -- Configurações para pickers específicos
        diagnostics = {
          theme = "ivy", -- Usa o tema "ivy" para diagnósticos
          initial_mode = "normal", -- Modo inicial normal
          layout_config = {
            preview_cutoff = 9999, -- Desativa a pré-visualização
          },
        },
        buffers = {
          theme = "ivy",
          initial_mode = "normal",
          previewer = false,
        }
      }
      opts.extensions = { -- Configurações para extensões
        file_browser = {
          theme = "dropdown", -- Usa o tema "dropdown" no navegador de arquivos
          hijack_netrw = true, -- Substitui o netrw pelo navegador do Telescope
          mappings = { -- Mapeamentos personalizados
            ["n"] = {
              ["N"] = fb_actions.create, -- Cria novos arquivos ou pastas
              ["h"] = fb_actions.goto_parent_dir, -- Vai para o diretório pai
              ["/"] = function()
                vim.cmd("startinsert") -- Inicia o modo de inserção
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr) -- Move a seleção para cima
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr) -- Move a seleção para baixo
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up, -- Rola a pré-visualização para cima
              ["<PageDown>"] = actions.preview_scrolling_down, -- Rola a pré-visualização para baixo
            },
          },
        },
      }
      telescope.setup(opts) -- Aplica as configurações
      telescope.load_extension("fzf") -- Carrega a extensão FZF
      telescope.load_extension("file_browser") -- Carrega a extensão de navegador de arquivos
    end,
  },
}

