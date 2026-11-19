-- Threat: !InfrastructureShared
-- Name: 1540b59b6f5b
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if string.find(l_0_3:lower(), "microsoft.net\\framework.-\\v[0-9.].+\\temporary asp.net files\\") or string.find(l_0_3:lower(), "microsoft\\exchange server\\v[0-9].+\\clientaccess\\owa\\bin") or string.find(l_0_3:lower(), "microsoft\\exchange server\\v[0-9].+\\frontend\\httpproxy\\owa\\bin") then
  return mp.INFECTED
end
return mp.CLEAN
