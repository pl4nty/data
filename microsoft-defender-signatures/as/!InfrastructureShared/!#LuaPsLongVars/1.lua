-- Threat: !InfrastructureShared
-- Name: !#Lua:PsLongVars
-- Type: 13
-- MpAttributes: Nscript:Type_ps & LUA:FileSizeGT2M.A

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 2000000 then
  return mp.CLEAN
end
local l_0_1 = mp.GetNormalizedScript(true)
for l_0_2 in string.gmatch(l_0_1, "%$[a-zA-Z0-9_]+") do
  if 150 < #l_0_2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
