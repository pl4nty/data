-- Threat: !#do_exhaustivehstr_rescan
-- Type: 8

if peattributes.lastscn_executable and peattributes.epoutofimage and peattributes.no_ep and peattributes.entrypoint_in_header and pehdr.AddressOfEntryPoint == 0 and pehdr.NumberOfSections == 9 and pesecs[pehdr.NumberOfSections].Name == ".imports" then
  local l_0_0 = mp.getfilesize()
  if 851968 < l_0_0 and l_0_0 < 905216 then
    return mp.INFECTED
  end
end
return mp.CLEAN
