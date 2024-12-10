function gen_comment(comment, separator, totalLength, commentChar)

  local padding = totalLength - #comment - 4
  local leftPadding = math.floor(padding / 2)
  local rightPadding = padding - leftPadding

  local formatted = commentChar .. " " ..  string.rep(separator, leftPadding) .. 
                    " " .. comment .. " " .. 
                    string.rep(separator, rightPadding)
  
  return formatted
end

function validate_arguments()
  if #arg > 4 then
    error("Too many argument provided.")
  else
    for i = 1, #arg do
        print("arg[" .. i .. "]" .. ": " .. arg[i])
    end
  end
end

function parse_arguments()
  local defaults = {
    comment     = arg[1] or "COMMENT",
    separator   = arg[2] or "=",
    totalLength = tonumber(arg[3]) or 80,
    commentChar = arg[4] or "#"
  }
  return defaults
end

function main()

  -- if #arg > 4 then
  --   -- Print an error message to stderr
  --   io.stderr:write("Error: Too many arguments provided.\n")
  --   io.stderr:write("Usage: lua script.lua [comment] [separator] [totalLength] [commentChar]\n")
  --
  --   -- Exit the program with a non-zero status code to indicate an error
  --   os.exit(1)
  -- end  

  -- Validate arguments
  local status, err = pcall(validate_arguments)

  if not status then
    -- Print an error message to stderr
    -- io.stderr:write("Error: " .. tostring(err) .. "\n")
    io.stderr:write("Error: Too many arguments provided\n")
    io.stderr:write("Usage: lua main.lua [comment] [separator] [totalLength] [commentChar]\n")

    -- Exit the program with a non-zero status code to indicate an error
    os.exit(1)

  end

  local args = parse_arguments() 

  -- res = gen_comment("TARGETS", "=", 80, "#")
  res = gen_comment(args.comment, args.separator, args.totalLength, args.commentChar)
  print(res)
end


main()

