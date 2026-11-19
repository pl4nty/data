-- Threat: !InfrastructureShared
-- Name: !#Lua:Havex.A
-- Type: 9

if peattributes.isdll == true and peattributes.hasexports == true and pehdr.DataDirectory[1].Size ~= 0 then
  local l_0_0 = pehdr.DataDirectory[1].RVA
  mp.readprotection(false)
  local l_0_1 = mp.readfile(pe.foffset_rva(l_0_0), 36)
  if mp.readu_u32(l_0_1, 21) == 2 and mp.readu_u32(l_0_1, 25) == 2 then
    local l_0_2 = mp.readu_u32(l_0_1, 33)
    l_0_1 = pe.mmap_rva(l_0_2, 4)
    local l_0_3 = mp.readu_u32(l_0_1, 1)
    local l_0_4 = pe.mmap_rva(l_0_3, 19)
    if l_0_4 == "RunDllEntry\000runDll\000" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
