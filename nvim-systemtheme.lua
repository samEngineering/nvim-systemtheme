
local M = {}

M.options = {

   -- Syntax Groups
   TSError          = "RED",
   TSPunctDelimiter = "FOREGROUND",
   TSPunctBracket   = "FOREGROUND",
   TSPunctSpecial   = "FOREGROUND",
   TSConstant       = "CYAN",
   TSConstBuiltin   = "CYAN",
   TSConstMacro     = "CYAN",
   TSStringRegex    = "GREEN",
   TSString         = "GREEN",
   TSStringEscape   = "CYAN",
   TSCharacter      = "CYAN",
   TSNumber         = "YELLOW_ALT",
   TSBoolean        = "YELLOW_ALT",
   TSFloat          = "YELLOW_ALT",
   TSAnnotation     = "YELLOW",
   TSAttribute      = "FOREGROUND",
   TSNamespace      = "MAGENTA",

   -- Functions
   TSFuncBuiltin        = "BLUE",
   TSFunction           = "BLUE",
   TSFuncMacro          = "CYAN",
   TSParameter          = "FOREGROUND",
   TSParameterReference = "FOREGROUND",
   TSMethod             = "CYAN",
   TSField              = "FOREGROUND",
   TSProperty           = "FOREGROUND",
   TSConstructor        = "MAGENTA",

   -- Keywords
   TSConditional     = "MAGENTA",
   TSRepeat          = "MAGENTA",
   TSLabel           = "FOREGROUND",
   TSKeyword         = "MAGENTA",
   TSKeywordFunction = "BLUE",
   TSKeywordOperator = "FOREGROUND",
   TSOperator        = "FOREGROUND",
   TSException       = "FOREGROUND",
   TSType            = "FOREGROUND",
   TSTypeBuiltin     = "FOREGROUND",
   TSStructure       = "FOREGROUND",
   TSInclude         = "FOREGROUND",

   -- Variables
   TSVariable        = "FOREGROUND",
   TSVariableBuiltin = "FOREGROUND",
   
   -- Text
   TSText      = "FOREGROUND",
   TSStrong    = "FOREGROUND",
   TSEmphasis  = "FOREGROUND",
   TSUnderline = "FOREGROUND",
   TSTitle     = "FOREGROUND",
   TSLiteral   = "FOREGROUND",
   TSURI       = "FOREGROUND",
   
   -- Tags
   TSTag          = "FOREGROUND",
   TSTagDelimiter = "FOREGROUND",
}



local function highlight(highlight_group, settings)                                      
   if type(settings) ~= "table" then
      vim.cmd(
         "highlight " .. highlight_group
         .. " guifg=" .. os.getenv(settings)
         .. " guibg='none' gui='none'"
      )
   else
      local fg = settings[1]
      local bg = settings[2]

      if fg ~= "none" then
         fg = os.getenv(fg)
      end

      if bg ~= "none" then
         bg = os.getenv(bg)
      end

      vim.cmd(
         "highlight " .. highlight_group 
         .. " guifg=" .. fg
         .. " guibg=" .. bg
         ..   " gui=" .. settings[3]
      )
   end
end





function M.setup(user_options)
   M.options = vim.tbl_extend('force', M.options, user_options)

   for key, value in pairs(M.options) do
      highlight(key, value)
   end
end

return M
