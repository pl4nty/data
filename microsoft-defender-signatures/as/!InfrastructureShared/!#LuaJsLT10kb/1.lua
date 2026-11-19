-- Threat: !InfrastructureShared
-- Name: !#LuaJsLT10kb
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = string.lower(string.sub(mp.getfilename(), -3))
if l_0_0 == ".js" or l_0_0 == "jse" then
  local l_0_1 = mp.getfilesize()
  if 1000 < l_0_1 and l_0_1 < 10000 then
    mp.set_mpattribute("//LuaJsLT10kb")
  end
  return mp.INFECTED
end
return mp.CLEAN
