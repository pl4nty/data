-- Threat: !InfrastructureShared
-- Name: !#LUA:AutoitDummylastSection
-- Type: 10

if peattributes.is_delphi then
  return mp.CLEAN
end
if not peattributes.isexe then
  return mp.CLEAN
end
if mp.ispackedwith("AutoHotKey_+") then
  return mp.CLEAN
end
if mp.ispackedwith("AutoIt_+") or mp.get_mpattributesubstring("Win32/AutoIt") or mp.get_mpattributesubstring("PESTATIC:cleanstub_autoitv") then
  if pesecs[1].Name ~= ".text" then
    return mp.CLEAN
  end
  local l_0_0 = 0
  while l_0_0 < 2 do
    local l_0_1 = pesecs[pehdr.NumberOfSections - l_0_0].Name
    if l_0_1 ~= ".extra" then
      if l_0_1 == ".rsrc" then
        return mp.CLEAN
      end
      if l_0_1 == ".reloc" then
        local l_0_2 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_BASERELOC].Size
        local l_0_3 = pesecs[1].SizeOfRawData / 2
        if l_0_2 < l_0_3 then
          return mp.CLEAN
        end
      end
      l_0_0 = l_0_0 + 1
    end
    l_0_0 = l_0_0 + 1
  end
  return mp.INFECTED
end
return mp.CLEAN
