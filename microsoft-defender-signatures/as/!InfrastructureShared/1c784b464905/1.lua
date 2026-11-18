-- Threat: !InfrastructureShared
-- Name: 1c784b464905
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if peattributes.isdll ~= true and peattributes.isexe ~= true then
  return mp.CLEAN
end
local r0_0 = "LdrUnregisterDllNot"
local r0_1 = { 19, 31 }
local r0_2 = #r0_0
local r0_3, r0_4, r0_5 = 1280, 1024, nil
for r0_6 = 1, pehdr.NumberOfSections do
  local r0_7 = pesecs[r0_6]
  if tostring(r0_7.Name) == ".rdata" then
    r0_5 = { rva = r0_7.VirtualAddress, size = r0_7.VirtualSize }
    break
  end
end
if r0_5 ~= nil and not (r0_5.size <= r0_3) then
  local r0_8 = r0_4
  local r0_9 = r0_5.size - r0_3
  if r0_9 < r0_8 then
    r0_8 = r0_9
  end
  if r0_8 < r0_1[1] + r0_2 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local r0_10 = pe.mmap_rva(r0_5.rva + r0_3, r0_8)
  if r0_10 == nil then
    return mp.CLEAN
  end
  local r0_11 = tostring(r0_10)
  for r0_12 = 1, #r0_1 do
    local r0_13 = r0_1[r0_12]
    for r0_14 = 0, #r0_11 - r0_13 - r0_2 do
      local r0_15 = true
      local r0_16 = r0_2 - 1
      for r0_17 = 0, r0_16 do
        local r0_18 = string.byte(r0_11, r0_14 + r0_17 + 1)
        local r0_19 = string.byte(r0_11, r0_14 + r0_13 + r0_17 + 1)
        local r0_20 = string.byte(r0_0, r0_17 + 1)
        if mp.bitxor(r0_18, r0_19) ~= r0_20 then
          r0_15 = false
          break
        end
      end
      if r0_15 then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
