-- Threat: !InfrastructureShared
-- Name: !#Lua:AutorunWorm
-- Type: 10

if mp.GetResmgrBasePlugin() ~= "AutorunInf" then
  return mp.CLEAN
end
local l_0_0 = false
local l_0_1 = false
if mp.get_mpattribute("Win32/AutoIt") or mp.get_mpattribute("Win32/AutoIt_HSTR1") or mp.get_mpattribute("Win32/AutoIt_HSTR2") then
  l_0_0 = true
end
if peattributes.isvbnative == true or peattributes.isvbpcode == true then
  l_0_1 = true
end
if l_0_0 then
  if not mp.get_mpattribute("AGGREGATOR:SuspiciousAutoIt") then
    return mp.CLEAN
  end
elseif l_0_1 then
  if not mp.get_mpattribute("RPF:vb_mfic") and not mp.get_mpattribute("RPF:vb_hfic") then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
return mp.INFECTED
