-- Threat: !InfrastructureShared
-- Name: 2089f847bd54
-- Type: 21

local l_0_0 = pevars.sigaddr
local l_0_1 = 256
local l_0_2 = pe.mmap_va(l_0_0, l_0_1)
local l_0_3 = string.find(l_0_2, "h\132\003%z%z")
local l_0_4 = string.find(l_0_2, "`\174\n%z")
if 0 < l_0_3 and 0 < l_0_4 then
  pe.mmap_patch_va(l_0_0 + 6, "\144\144")
  pe.mmap_patch_va(l_0_0 + 14, "\235")
  for l_0_5 = 1, 192 do
    if pe.mmap_va(l_0_0 + l_0_5 + 64, 3) == "\000\255\021" then
      pe.mmap_patch_va(l_0_0 + l_0_5 + 65, "\144\144\144\144\144\144")
    end
  end
  mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
  return mp.INFECTED
end
return mp.CLEAN
