-- Threat: !InfrastructureShared
-- Name: 192931bbaa46
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil then
  return mp.CLEAN
end
if 50 < l_0_0 and l_0_0 < 10485760 then
  mp.readprotection(false)
  local l_0_1 = mp.readfile(0, 7)
  mp.readprotection(true)
  if l_0_1 == nil or #l_0_1 == 0 or #l_0_1 ~= 7 then
    return mp.CLEAN
  end
  if l_0_1 == "{\\rtf1{" then
    mp.set_mpattribute("MpIsExhaustiveScriptScan")
    return mp.INFECTED
  end
end
return mp.CLEAN
