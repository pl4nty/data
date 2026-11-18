-- Threat: !InfrastructureShared
-- Name: 1c896aa8f62f
-- Type: 21

if (pe.mmap_va(pevars.sigaddr + 2, 4) == "`\174\n\000" or pe.mmap_va(pevars.sigaddr + 2, 4) == "\224\147\004\000" or pe.mmap_va(pevars.sigaddr + 2, 4) == "@B\015\000" or pe.mmap_va(pevars.sigaddr + 2, 4) == "\128\132\030\000" or pe.mmap_va(pevars.sigaddr + 2, 4) == "\136\019\000\000" or pe.mmap_va(pevars.sigaddr + 2, 4) == "@KL\000") and (pe.mmap_va(pevars.sigaddr + 9, 1) == "]" or pe.mmap_va(pevars.sigaddr + 9, 1) == "}") then
  pe.mmap_patch_va(pevars.sigaddr + 6, "\144\144")
  pe.mmap_patch_va(pevars.sigaddr + 11, "\235")
  mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
  local l_0_0 = 256
  local l_0_1 = pe.mmap_va(pevars.sigaddr, l_0_0)
  local l_0_2 = string.find(l_0_1, "h@B\015%z")
  local l_0_3 = string.find(l_0_1, "`\174\n%z")
  local l_0_4 = string.find(l_0_1, "j%z")
  local l_0_5 = string.find(l_0_1, "j\002", 1, true)
  local l_0_6 = string.find(l_0_1, "\255%z%z%zj")
  local l_0_7 = string.find(l_0_1, "\255%z%z%zh")
  local l_0_8 = string.find(l_0_1, "j\001", 1, true)
  local l_0_9 = string.find(l_0_1, "h\001%z\031%z")
  local l_0_10 = string.find(l_0_1, "h\132\003%z%z")
  local l_0_11 = string.find(l_0_1, "h \003%z%z")
  if l_0_2 and l_0_3 then
    if l_0_4 and l_0_5 then
      for l_0_12 = 1, 48 do
        if pe.mmap_va(pevars.sigaddr + l_0_12 + l_0_5, 3) == "\000\255\021" then
          pe.mmap_patch_va(pevars.sigaddr + l_0_12 + l_0_5 + 1, "YYY\144\144\144")
        end
      end
    end
    if (l_0_6 or l_0_7) and l_0_8 then
      for l_0_13 = 1, 48 do
        if pe.mmap_va(pevars.sigaddr + l_0_13 + l_0_8, 3) == "\000\255\021" then
          pe.mmap_patch_va(pevars.sigaddr + l_0_13 + l_0_8 + 1, "YYY\144\144\144")
        end
      end
    end
    if l_0_9 then
      for l_0_14 = 1, 48 do
        if pe.mmap_va(pevars.sigaddr + l_0_14 + l_0_9, 3) == "\000\255\021" then
          pe.mmap_patch_va(pevars.sigaddr + l_0_14 + l_0_9 + 1, "YYY\144\144\144")
        end
      end
    end
    if l_0_10 or l_0_11 then
      for l_0_15 = 1, 160 do
        if pe.mmap_va(pevars.sigaddr + l_0_15 + l_0_3, 1) == "\232" then
          pe.mmap_patch_va(pevars.sigaddr + l_0_15 + l_0_3, "\144\144\144\144\144")
        elseif pe.mmap_va(pevars.sigaddr + l_0_15 + l_0_3, 2) == "\255\021" then
          pe.mmap_patch_va(pevars.sigaddr + l_0_15 + l_0_3, "\144\144\144\144\144\144")
        end
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
