-- Threat: !#PUA:Block:OfferCore
-- Type: 10
-- MpAttributes: PUA:CERT:Softonic

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.FileDescription
if l_0_1 then
  l_0_1 = string.lower(l_0_1)
else
  l_0_1 = ""
end
if l_0_1 == "setup/uninstall" then
  return mp.CLEAN
end
return mp.INFECTED
