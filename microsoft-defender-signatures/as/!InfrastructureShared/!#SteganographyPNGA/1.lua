-- Threat: !InfrastructureShared
-- Name: !#SteganographyPNG.A
-- Type: 12
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & (SCPT:HasPngHeader | BM_PNG_FILE)

local l_0_0 = mp.getfilesize()
if 500 < l_0_0 and l_0_0 < 5242880 then
  local l_0_1 = tostring(footerpage)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_2:find("\\cache\\", 1, true) and StringStartsWith(l_0_3, "f_") then
    return mp.CLEAN
  end
  
  function msb_unpack(l_1_0, l_1_1)
    local l_1_2, l_1_3, l_1_4, l_1_5 = string.byte(l_1_0, l_1_1, l_1_1 + 3)
    return ((l_1_2 * 256 + l_1_3) * 256 + l_1_4) * 256 + l_1_5
  end
  
  function process_chunk(l_2_0, l_2_1, l_2_2)
    if l_2_0 ~= nil and l_2_2 >= l_2_1 + 12 then
      local l_2_3 = {}
      local l_2_4 = msb_unpack(l_2_0, l_2_1)
      local l_2_5 = msb_unpack(l_2_0, l_2_1 + 4)
      local l_2_6
      if l_2_2 - (l_2_1 + 4 + l_2_4) > 0 then
        l_2_6 = msb_unpack(l_2_0, l_2_1 + l_2_4 + 8)
        if 0 < l_2_4 then
          l_2_3.databegin = l_2_1 + 5
          l_2_3.dataend = l_2_3.databegin + l_2_4
        end
        l_2_3.next = l_2_1 + l_2_4 + 12
      end
      l_2_3.length = l_2_4
      l_2_3.type = l_2_5
      l_2_3.crc = l_2_6
      return l_2_3
    end
    return nil
  end
  
  local l_0_4
  local l_0_5, l_0_6 = string.find(l_0_1, "IEND", 1, true)
  if l_0_5 and l_0_6 then
    l_0_4 = process_chunk(l_0_1, l_0_5 - 4, l_0_0)
  end
  if l_0_5 == nil or l_0_4 == nil then
    mp.set_mpattribute("Lua:PngWithoutIENDFooter")
  else
    if l_0_4.length > 0 then
      mp.set_mpattribute("Lua:PngWithAbnormalIENDLength")
    end
    if l_0_0 < l_0_6 + 4 then
      mp.set_mpattribute("Lua:PngWithDataAfterIEND")
    end
    if l_0_4.crc ~= 2923585666 then
      mp.set_mpattribute("Lua:PngWithAbnormalIENDCrc")
    end
  end
end
return mp.INFECTED
