-- Threat: !InfrastructureShared
-- Name: 2f29755c4357
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 then
  l_0_0 = string.lower(l_0_0)
  if l_0_0:find("\\windows\\system32\\drivers\\etc\\hosts", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
