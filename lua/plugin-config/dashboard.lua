local status, db = pcall(require, "dashboard")
if not status then
   vim.notify("no dashboard")
   return
end

db.setup({
      theme = 'hyper',
      config = {
         week_header = {
            enable = true,
         },
         shortcut = {
            { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
               icon = ' ',
               icon_hl = '@variable',
               desc = 'Files',
               group = 'Label',
               action = 'Telescope find_files',
               key = 'f',
            },
            {
               desc = ' Apps',
               group = 'DiagnosticHint',
               action = 'Telescope app',
               key = 'a',
            },
            {
               desc = ' dotfiles',
               group = 'Number',
               action = 'Telescope dotfiles',
               key = 'd',
            },
         },
         footer = {
            '',
            ' 🚀 ThingsEngine -- Do one thing, do it well.',
         },
      },
})

-- db.setup({
--       theme = "doom",
--       config = {
--          header = {
--             [[]],
--             [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
--             [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
--             [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
--             [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
--             [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
--             [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
--             [[                                                   ]],
--             [[                [ version : 3.14 ]                 ]],
--          },
--          shortcut = {
--             { desc = '[  Github]', group = 'DashboardShortCut' },
--             { desc = '[  Ethanlinyf]', group = 'DashboardShortCut' },
--             { desc = '[  0.1.3]', group = 'DashboardShortCut' },
--          },
--          center = {
--             {
--                icon = ' ',
--                icon_hl = 'Title',
--                desc = 'Find File           ',
--                desc_hl = 'String',
--                key = 'b',
--                keymap = 'SPC f f',
--                key_hl = 'Number',
--                action = 'lua print(2)'
--             },
--             {
--                icon = ' ',
--                desc = 'Find Dotfiles',
--                key = 'f',
--                keymap = 'SPC f d',
--                action = 'lua print(3)'
--             },
--          },
--          footer = {
--             '',
--             ' 🚀 ThingsEngine -- Something Good as Indicated',
--          },
--       }
-- })
