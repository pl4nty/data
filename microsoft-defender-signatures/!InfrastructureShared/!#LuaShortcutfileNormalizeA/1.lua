-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaShortcutfileNormalizeA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("PACKED_WITH:[CMDEmbedded]") then
  local l_0_0 = tostring(headerpage)
  local l_0_1 = 10
  local l_0_2 = (string.find)(l_0_0, "\000\000", 1, true)
  if l_0_2 == nil or l_0_2 <= l_0_1 then
    return mp.CLEAN
  end
  l_0_0 = l_0_0:sub(0, l_0_2)
  local l_0_3 = nil
  local l_0_4 = false
  do
    if (string.find)(l_0_0, "\"", 1, true) ~= nil then
      local l_0_5 = 0
      l_0_3 = l_0_0:gsub("\"", "")
      if l_0_0 and l_0_1 < l_0_5 then
        l_0_4 = true
      end
    end
    -- DECOMPILER ERROR at PC52: Overwrote pending register: R5 in 'AssignReg'

    do
      do
        if (l_0_5.find)(l_0_0, "^", 1, true) ~= nil then
          local l_0_6 = 0
          l_0_3 = l_0_0:gsub("^", "")
          if l_0_0 and l_0_1 < l_0_6 then
            l_0_4 = true
          end
        end
        -- DECOMPILER ERROR at PC77: Overwrote pending register: R5 in 'AssignReg'

        if l_0_4 == true and l_0_3 ~= nil and l_0_1 < l_0_6 then
          (mp.vfo_add_buffer)(l_0_3, "[CMDEmbeddedNorm]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

