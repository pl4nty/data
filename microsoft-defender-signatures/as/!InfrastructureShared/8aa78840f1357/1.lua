-- Threat: !InfrastructureShared
-- Name: 8aa78840f1357
-- Type: 21

for l_0_0 = 1, pehdr.NumberOfSections do
  if pesecs[l_0_0].Name == "snapshot" then
    local l_0_1 = pesecs[l_0_0].PointerToRawData
    local l_0_2 = pesecs[l_0_0].SizeOfRawData
    if l_0_1 ~= 0 and l_0_2 ~= 0 and l_0_1 + l_0_2 <= mp.getfilesize() then
      mp.readprotection(false)
      local l_0_3 = mp.readfile(l_0_1, l_0_2)
      mp.readprotection(true)
      mp.vfo_add_buffer(l_0_3, "[DartAotSnapshot]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
