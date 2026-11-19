-- Threat: !InfrastructureShared
-- Name: !#Lua:MemDumpNewlyCreated.A
-- Type: 12
-- MpAttributes: BM_MEMDUMP_FILE & MpOnCloseNewlyCreatedHintRtpScan

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.readu_u32(headerpage, 9)
if r0_0 ~= nil and not (r0_0 <= 0) and not (r0_0 >= 32) then
  local r0_1 = mp.readu_u32(headerpage, 13)
  if r0_1 ~= nil and r0_1 ~= 0 then
    for r0_2 = 0, r0_0 - 1 do
      local r0_3 = r0_1 + r0_2 * 12
      local r0_4 = mp.readu_u32(headerpage, r0_3 + 1)
      local r0_5 = mp.readu_u32(headerpage, r0_3 + 9)
      if r0_4 == 4 then
        mp.readprotection(false)
        local r0_6 = mp.readfile(r0_5 + 24, 4)
        if r0_6 == nil then
          return mp.CLEAN
        end
        r0_6 = mp.readu_u32(r0_6, 1)
        local r0_7 = mp.readfile(r0_6, 4)
        if r0_7 == nil then
          return mp.CLEAN
        end
        local r0_8 = mp.readu_u32(r0_7, 1)
        if r0_8 == nil or r0_8 == 0 or r0_8 >= 256 then
          return mp.CLEAN
        end
        local r0_9 = mp.readfile(r0_6 + 4, r0_8)
        if r0_9 == nil then
          return mp.CLEAN
        end
        local r0_10 = string.gsub(r0_9, "%z", "")
        do
          local r0_11 = string.lower(r0_10)
          r0_10 = r0_11
        end
        if not r0_10:match("%.exe$") then
          break
        end
        local r0_12 = mp.readu_u64(headerpage, 25)
        mp.set_mpattribute("LUA:MemDumpType_" .. string.format("%x", r0_12))
        local r0_13 = 2
        if mp.bitand(r0_12, r0_13) == r0_13 then
          mp.set_mpattribute("LUA:MemDumpType_WithFullMem")
        end
        local r0_14 = r0_10:match("([^\\]+)$")
        mp.set_mpattribute("LUA:MemDump!" .. r0_14)
        if string.find(r0_10, "c:\\windows\\system32\\lsass.exe", 1, true) then
          mp.set_mpattribute("BM_MEMDUMP_FILE_LSASS")
        end
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
