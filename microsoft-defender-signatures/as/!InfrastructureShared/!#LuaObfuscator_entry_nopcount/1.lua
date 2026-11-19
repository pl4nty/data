-- Threat: !InfrastructureShared
-- Name: !#Lua:Obfuscator_entry_nopcount
-- Type: 9

if peattributes.epscn_islast and peattributes.epscn_writable and peattributes.firstsectwritable and (epcode[1] == 96 or epcode[1] == 144) and pesecs[pehdr.NumberOfSections].SizeOfRawData < 4096 and pe.OPCLOG_SZ > 20 then
  local l_0_0 = 0
  local l_0_1 = 1
  while l_0_1 < 20 do
    if opclog[l_0_1].value == 144 then
      l_0_0 = l_0_0 + 1
    end
    l_0_1 = l_0_1 + 1
  end
  if 7 <= l_0_0 then
    mp.set_mpattribute("Lua:Obfuscator_entry_nopcount")
  end
end
return mp.CLEAN
