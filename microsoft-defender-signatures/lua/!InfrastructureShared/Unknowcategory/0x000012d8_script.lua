-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000012d8_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = l_0_0:match("^(.-)\\\\(.-)$")
  if l_0_1 == nil or l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if (string.match)((string.lower)(l_0_1), "^hklm") then
    local l_0_4 = (sysio.RegOpenKey)(l_0_1)
    if not l_0_4 then
      return mp.CLEAN
    end
    l_0_3 = (sysio.GetRegValueAsBinary)(l_0_4, l_0_2)
    if not l_0_3 then
      return mp.CLEAN
    end
  else
    do
      if (string.match)((string.lower)(l_0_1), "^hkcu") then
        local l_0_5 = (sysio.RegExpandUserKey)(l_0_1)
        if l_0_5 then
          for l_0_9,l_0_10 in pairs(l_0_5) do
            if (string.find)((string.lower)(l_0_10), "hkcu@s-1-5-21-", 1, true) then
              local l_0_11 = (sysio.RegOpenKey)(l_0_10)
              if l_0_11 then
                do
                  do
                    l_0_3 = (sysio.GetRegValueAsBinary)(l_0_11, l_0_2)
                    if l_0_3 then
                      break
                    end
                    -- DECOMPILER ERROR at PC107: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC107: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC107: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC107: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC107: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
      if l_0_3 then
        l_0_5 = MpCommon
        l_0_5 = l_0_5.BinaryRegExpSearch
        l_0_5 = l_0_5("MZ", l_0_3)
        local l_0_12 = nil
        if l_0_5 then
          l_0_12 = MpCommon
          l_0_12 = l_0_12.BinaryRegExpSearch
          l_0_12 = l_0_12("This program cannot be run in DOS mode", l_0_3)
          local l_0_13 = nil
          if l_0_12 then
            l_0_13 = bm
            l_0_13 = l_0_13.trigger_sig
            l_0_13("RegistrySetBinaryDataMZ", l_0_0)
          end
        end
      end
      do
        l_0_0 = mp
        l_0_0 = l_0_0.CLEAN
        return l_0_0
      end
    end
  end
end

