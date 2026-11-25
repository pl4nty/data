-- Threat: !InfrastructureShared
-- Name: 3b78ea6d5559
-- Type: 21

if pehdr == nil or pehdr.NumberOfSections < 2 or pesecs[pehdr.NumberOfSections].SizeOfRawData <= 1024 or pesecs[1].Name ~= ".text" or pe == nil then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].Name ~= ".reloc" and pesecs[pehdr.NumberOfSections].Name ~= ".rsrc" then
  return mp.CLEAN
end
if epcode[1] == 232 and epcode[6] == 233 and epcode[10] == 255 then
  local l_0_0
  local l_0_1 = mp.getfilesize()
  local l_0_2 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_SECURITY].RVA
  if l_0_1 == nil or l_0_2 == nil or l_0_1 == 0 or l_0_2 == 0 or l_0_1 < l_0_2 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  l_0_0 = mp.readfile(l_0_2, 10)
  mp.readprotection(true)
  if l_0_0 == nil or not #l_0_0 == 10 then
    return mp.CLEAN
  end
  local l_0_3 = mp.readu_u32(l_0_0, 1)
  local l_0_4 = mp.readu_u32(l_0_0, 5)
  if l_0_3 == 2983871354 and l_0_4 == 418221723 then
    if peattributes.x86_image then
      if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
        mp.set_mpattribute("do_exhaustivehstr_rescan")
      end
    elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
      mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
