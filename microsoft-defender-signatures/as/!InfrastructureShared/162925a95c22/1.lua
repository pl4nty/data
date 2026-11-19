-- Threat: !InfrastructureShared
-- Name: 162925a95c22
-- Type: 21

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("PSScriptWithServiceStopCommand", true)
if l_0_0 == 0 and l_0_1 == true then
  local l_0_2, l_0_3 = mp.UfsGetMetadataBool("PSScriptWithConvertFromB64", true)
  if l_0_2 == 0 and l_0_3 == true then
    return mp.INFECTED
  end
end
return mp.CLEAN
