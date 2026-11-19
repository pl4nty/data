-- Threat: !InfrastructureShared
-- Name: 22895512df16
-- Type: 21

if (pe.mmap_va(pevars.sigaddr + 1, 1) == "\254" or pe.mmap_va(pevars.sigaddr + 1, 1) == "\255") and (pe.mmap_va(pevars.sigaddr + 14, 1) == "\000" or pe.mmap_va(pevars.sigaddr + 14, 1) == "\001" or pe.mmap_va(pevars.sigaddr + 14, 1) == "\016") then
  pe.mmap_patch_va(pevars.sigaddr + 6, "\144\144")
  pe.mmap_patch_va(pevars.sigaddr + 15, "\235")
  mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
  local l_0_0 = 256
  local l_0_1 = pe.mmap_va(pevars.sigaddr, l_0_0)
  local l_0_2 = string.find(l_0_1, "h@B\015%z")
  local l_0_3 = string.find(l_0_1, "`\174\n%z")
  local l_0_4 = string.find(l_0_1, "h\001%z\031%z")
  local l_0_5 = string.find(l_0_1, "h\132\003%z%z")
  if l_0_2 and l_0_3 then
    for l_0_6 = 1, 256 - l_0_2 do
      if pe.mmap_va(pevars.sigaddr + l_0_6 + l_0_3, 3) == "P\255\021" then
        pe.mmap_patch_va(pevars.sigaddr + l_0_6 + l_0_3 + 1, "YYY\144\144\144")
      end
    end
    if l_0_4 then
      for l_0_7 = 1, 48 do
        if pe.mmap_va(pevars.sigaddr + l_0_7 + l_0_4, 4) == "\031\000\255\021" then
          pe.mmap_patch_va(pevars.sigaddr + l_0_7 + l_0_4 + 2, "YYY\144\144\144")
        end
      end
    end
    if l_0_5 then
      for l_0_8 = 1, 160 do
        if pe.mmap_va(pevars.sigaddr + l_0_8 + l_0_5, 3) == "\000\255\021" then
          pe.mmap_patch_va(pevars.sigaddr + l_0_8 + l_0_5 + 1, "\144\144\144\144\144\144")
        end
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
