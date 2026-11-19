-- Threat: !InfrastructureShared
-- Name: 5a95fc015177
-- Type: 21

local l_0_0 = 19
if string.byte(pe.mmap_va(pevars.sigaddr + 13, 1)) ~= 232 then
  l_0_0 = 20
end
local l_0_1 = pe.mmap_va(pevars.sigaddr + l_0_0, 16)
local l_0_2 = string.find(l_0_1, "\131\193", 1, true)
if l_0_2 == nil then
  l_0_2 = string.find(l_0_1, "\131\233", 1, true)
  if l_0_2 == nil then
    l_0_2 = string.find(l_0_1, "\131\234", 1, true)
    if l_0_2 == nil then
      l_0_2 = string.find(l_0_1, "\131\235", 1, true)
      if l_0_2 == nil then
        l_0_2 = string.find(l_0_1, "\131\238", 1, true)
        if l_0_2 == nil then
          l_0_2 = string.find(l_0_1, "\128,", 1, true)
          if l_0_2 ~= nil then
            l_0_0 = l_0_0 - 1
            l_0_2 = l_0_2 + 1
          end
        end
      end
    end
  end
end
for l_0_3 = 1, l_0_2 - 1 do
  pe.mmap_patch_va(pevars.sigaddr + l_0_0 + l_0_3 - 1, "\144")
end
return mp.INFECTED
