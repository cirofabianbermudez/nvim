local function parse_arguments(args)
  return {
    comment     = args.fargs[1] or "COMMENT",
    separator   = args.fargs[2] or "=",
    totalLength = tonumber(args.fargs[3]) or 80,
    commentChar = args.fargs[4] or "#",
    innerSpace  = tonumber(args.fargs[5]) or 1
  }
end

local function gen_comment(config)

  -- Set fefault values if not provided in the config table
  local comment     = config.comment or "COMMENT"
  local separator   = config.separator or "="
  local totalLength = config.totalLength or 80
  local commentChar = config.commentChar or "#"
  local innerSpace  = config.innerSpace  or 1

  -- Calculate padding
  local padding = totalLength - #comment - #commentChar - innerSpace*2 - 1
  local leftPadding = math.floor(padding / 2)
  local rightPadding = padding - leftPadding

  -- Generate formatted comment
  local formatted = commentChar .. " " ..  
                    string.rep(separator, leftPadding) .. 
                    string.rep(" ",innerSpace) ..
                    comment ..
                    string.rep(" ",innerSpace) ..
                    string.rep(separator, rightPadding)

  return formatted
end


function main(args)
  local config = parse_arguments(args)
  local comment = gen_comment(config)

  vim.api.nvim_put({comment}, 'c', true, true)
end


vim.api.nvim_create_user_command(
  "Headcom", 
  main, 
  { nargs = "*" }
)
