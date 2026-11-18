-- Threat: !InfrastructureShared
-- Name: 208b37497475f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 and string.find(l_0_0, "\\svchost.exe", -12, true) then
  return mp.CLEAN
end
if isTamperProtectionOn() then
  local l_0_1, l_0_2 = bm.get_process_relationships()
  if l_0_1 then
    for l_0_3, l_0_4 in ipairs(l_0_1) do
      if l_0_4.ppid and mp.bitand(l_0_4.reason_ex, 1) == 1 then
        bm.add_related_process(l_0_4.ppid)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
