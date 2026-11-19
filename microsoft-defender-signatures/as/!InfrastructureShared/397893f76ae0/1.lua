-- Threat: !InfrastructureShared
-- Name: 397893f76ae0
-- Type: 21

if not peattributes.isdll and not peattributes.amd64_image then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= "ffmpeg.dll" then
  return mp.CLEAN
end
if mp.getfilesize() < 2097652 or mp.getfilesize() > 5242880 then
  return mp.CLEAN
end

local function l_0_1(l_1_0, l_1_1)
  return string.find(l_1_0, l_1_1:gsub(".", function(l_2_0)
    return string.format("%c\000", string.byte(l_2_0))
  end):gsub("%z+$", ""), 1, true)
end

local function l_0_2(l_3_0)
  local l_3_1 = tonumber(l_3_0:reverse():gsub(".", function(l_4_0)
    return string.format("%02x", string.byte(l_4_0))
  end), 16)
  l_3_1 = 2147483647 <= l_3_1 and l_3_1 - 4294967296 or l_3_1
  return l_3_1
end

local l_0_3 = hstrlog[1]
local l_0_4 = l_0_3.VA
if hstrlog[1].matched == true then
  local l_0_5 = l_0_4 + l_0_3.match_offsets[l_0_3.match_offsets_count]
  local l_0_6 = doshdr.e_lfanew + 49
  local l_0_7 = mp.readu_u64(headerpage, l_0_6)
  l_0_5 = l_0_5 + 5 + l_0_2(pe.mmap_va(l_0_5 + 1, 4))
  local l_0_8 = l_0_5 - pesecs[pevars.epsec].VirtualAddress
  local l_0_9 = pesecs[pevars.epsec].PointerToRawData + l_0_8 - l_0_7
  mp.readprotection(false)
  local l_0_10 = l_0_9 + 9
  local l_0_11 = mp.readfile(l_0_10, 5)
  if l_0_11:byte(1) == 232 then
    l_0_10 = l_0_10 + 5 + l_0_2(l_0_11:sub(2, 5))
    local l_0_12 = "VWUSH\129\236\144\001\004H\139\144\001\016L\141\r\144\000"
    local l_0_13 = 32
    local l_0_14 = mp.BMSearchFile(l_0_10, 100, l_0_12)
    if l_0_14 ~= -1 then
      l_0_14 = l_0_10 + l_0_14 + l_0_13
      local l_0_15 = l_0_14 - pesecs[pevars.epsec].PointerToRawData + pesecs[pevars.epsec].VirtualAddress
      l_0_15 = l_0_15 + 4 + l_0_2(mp.readfile(l_0_14, 4))
      local l_0_16 = 0
      for l_0_17 = 1, pehdr.NumberOfSections do
        if pe.contains_rva(l_0_17, l_0_15) then
          l_0_16 = l_0_15 - pesecs[l_0_17].VirtualAddress + pesecs[l_0_17].PointerToRawData
          break
        end
      end
      if l_0_16 ~= 0 then
        local l_0_18 = mp.readfile(l_0_16, 200)
        local l_0_19 = {
          "AVMonitorRefreshEvent",
          "d3dcompiler_"
        }
        for l_0_20, l_0_21 in ipairs(l_0_19) do
          if l_0_1(l_0_18, l_0_21) == nil then
            return mp.CLEAN
          end
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
