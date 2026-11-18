-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspExecInArchive
-- Type: 10
-- MpAttributes: LUA:FileSizeGT4M.A & InEmail

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil or string.len(l_0_0) < 10 then
  return mp.CLEAN
end
local l_0_1 = l_0_0:sub(-4)
local l_0_2 = {
  [".exe"] = true,
  [".scr"] = true,
  [".pif"] = true
}
if l_0_2[l_0_1] == true then
  if not l_0_0:find(".zip->", 1, true) and not l_0_0:find(".rar->", 1, true) and not l_0_0:find(".7z->", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
