-- Threat: !InfrastructureShared
-- Name: 164b3745323da
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  local l_0_0, l_0_1 = bm.get_process_relationships()
  if l_0_0 then
    for l_0_2, l_0_3 in ipairs(l_0_0) do
      if l_0_3.ppid then
        bm.add_related_process(l_0_3.ppid)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
