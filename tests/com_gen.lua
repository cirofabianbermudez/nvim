function gen_comment(config)

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

function parse_arguments()
  return {
    comment     = arg[1] or "COMMENT",
    separator   = arg[2] or "=",
    totalLength = tonumber(arg[3]) or 80,
    commentChar = arg[4] or "#",
    innerSpace  = tonumber(arg[5]) or 1
  }
end

function validate_arguments()
  if #arg > 5 then
    error("Too many argument provided.")
  end
end


function main()

  -- Validate command line arguments
  local status, err = pcall(validate_arguments)

  if not status then
    io.stderr:write("Error: Too many arguments provided\n")
    io.stderr:write("Usage: lua main.lua [comment] [separator] [totalLength] [commentChar] [innerSpace] \n")
    os.exit(1)
  end

  -- Parse arguments
  local args = parse_arguments() 

  -- Generate comment using the table
  local result = gen_comment(args)

  -- Print the result
  print(result)
end

-- Call to the main function
main()

