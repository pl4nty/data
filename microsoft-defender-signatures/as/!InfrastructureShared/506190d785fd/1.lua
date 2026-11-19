-- Threat: !InfrastructureShared
-- Name: 506190d785fd
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 20480000 <= l_0_0 then
  local l_0_1 = pe.get_versioninfo()
  if not l_0_1 then
    return mp.CLEAN
  end
  if not l_0_1.CompanyName then
    return mp.CLEAN
  end
  if l_0_1.CompanyName == "Microsoft Corporation" then
    return mp.INFECTED
  end
end
return mp.CLEAN
