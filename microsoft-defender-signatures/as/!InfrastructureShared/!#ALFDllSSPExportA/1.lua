-- Threat: !InfrastructureShared
-- Name: !#ALF:DllSSPExport.A
-- Type: 10

if peattributes.isdll and pehdr.Machine == 332 and peattributes.hasexports and pehdr.DataDirectory[1].Size ~= 0 and not peattributes.isappcontainer and not peattributes.dmg_truncated and not mp.get_mpattribute("Clean:DllSSPExport") then
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 10000 or 1000000 < l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = pehdr.DataDirectory[1].RVA
  mp.readprotection(false)
  local l_0_2 = mp.readfile(pe.foffset_rva(l_0_1), 36)
  local l_0_3 = mp.readu_u32(l_0_2, 25)
  if 4 <= l_0_3 and l_0_3 <= 30 then
    local l_0_4 = mp.readu_u32(l_0_2, 33)
    local l_0_5 = 20
    local l_0_6 = 0
    for l_0_7 = 0, l_0_3 - 1 do
      local l_0_8 = l_0_4 + l_0_7 * 4
      l_0_2 = pe.mmap_rva(l_0_8, 4)
      local l_0_9 = mp.readu_u32(l_0_2, 1)
      local l_0_10 = string.lower(string.format("%s", pe.mmap_rva(l_0_9, l_0_5)))
      if l_0_10 == "spinitialize" then
        l_0_6 = mp.bitor(l_0_6, 1)
      elseif l_0_10 == "spshutdown" then
        l_0_6 = mp.bitor(l_0_6, 2)
      elseif l_0_10 == "spgetinfo" then
        l_0_6 = mp.bitor(l_0_6, 4)
      elseif l_0_10 == "splsamodeinitialize" then
        l_0_6 = mp.bitor(l_0_6, 8)
      end
      if 15 <= l_0_6 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
