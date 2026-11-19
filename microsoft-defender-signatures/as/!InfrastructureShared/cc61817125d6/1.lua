-- Threat: !InfrastructureShared
-- Name: cc61817125d6
-- Type: 21

local l_0_0 = mp.GetUACMetadata()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.Type ~= mp.AMSI_UAC_REQUEST_TYPE_COM then
  return mp.CLEAN
end
if string.lower(l_0_0.Info.Clsid) ~= "48012511-82cc-48f3-ae5b-40c7401a5a09" then
  return mp.CLEAN
end
return mp.INFECTED
