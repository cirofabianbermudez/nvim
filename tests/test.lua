require("lfs")
-- no function checks for errors.
-- you should check for them

function IsFile(name)
	if type(name) ~= "string" then
		return false
	end
	if not isDir(name) then
		return os.rename(name, name) and true or false
		-- note that the short evaluation is to
		-- return false instead of a possible nil
	end
	return false
end

function IsFileOrDir(name)
	if type(name) ~= "string" then
		return false
	end
	return os.rename(name, name) and true or false
end

function IsDir(name)
	if type(name) ~= "string" then
		return false
	end
	local cd = lfs.currentdir()
	local is = lfs.chdir(name) and true or false
	lfs.chdir(cd)
	return is
end
