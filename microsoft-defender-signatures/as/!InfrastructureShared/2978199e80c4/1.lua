-- Threat: !InfrastructureShared
-- Name: 2978199e80c4
-- Type: 21
-- Flags: 1

if peattributes.isdll and peattributes.hasexports then
  local l_0_0 = pe.mmap_va(pehdr.ImageBase + pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].RVA, 40)
  local l_0_1 = mp.readu_u32(l_0_0, 13)
  local l_0_2 = pe.mmap_va(pehdr.ImageBase + l_0_1, 32)
  if string.sub(l_0_2, 1, 17) == "dll_down_exec.dll" then
    return mp.INFECTED
  end
end
return mp.CLEAN
