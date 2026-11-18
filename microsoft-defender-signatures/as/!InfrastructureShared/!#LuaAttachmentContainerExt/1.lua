-- Threat: !InfrastructureShared
-- Name: !#//Lua:AttachmentContainerExt
-- Type: 12

local l_0_0 = string.lower(string.sub(mp.getfilename(), -3))
if l_0_0 == ".7z" or l_0_0 == ".gz" then
  mp.UfsSetMetadataBool("Lua:AttachmentContainerExt", true)
  return mp.INFECTED
elseif l_0_0 == "zip" or l_0_0 == "ace" or l_0_0 == "rar" then
  local l_0_1 = string.sub(mp.getfilename(), -4, -4)
  if l_0_1 == "." then
    mp.UfsSetMetadataBool("Lua:AttachmentContainerExt", true)
    return mp.INFECTED
  end
end
return mp.CLEAN
