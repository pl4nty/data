-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9bb_luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpDetection.GetCurrentThreat)()
if (string.find)(l_0_0.Name, "Behavior:Win32/WFP_BFE.B", 1, true) then
  local l_0_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\BFE\\Parameters\\Policy\\Persistent\\Filter"
  local l_0_2 = (sysio.RegOpenKey)(l_0_1)
  if l_0_2 then
    local l_0_3 = (sysio.RegEnumValues)(l_0_2)
    for l_0_7,l_0_8 in pairs(l_0_3) do
      local l_0_9 = (sysio.GetRegValueType)(l_0_2, l_0_8)
      if l_0_9 == 3 then
        local l_0_10 = (sysio.GetRegValueAsBinary)(l_0_2, l_0_8)
        if l_0_10 then
          local l_0_11, l_0_12 = (string.find)(l_0_10, "A\000\000\000\b\000\002\000\000\000\000\000\000\000\000\000", 80, true)
          if l_0_12 then
            l_0_11 = (string.find)(l_0_10, "\f\000\002\000\001", l_0_12, true)
            if l_0_12 then
              local l_0_13 = false
              if (string.find)(l_0_10, " \136\0034\167\003", l_0_12, true) or (string.find)(l_0_10, "\129\019ʦS\214", l_0_12, true) or (string.find)(l_0_10, "\f\136\027gO\244", l_0_12, true) or (string.find)(l_0_10, "\1720*��=", l_0_12, true) then
                l_0_13 = true
              end
              if l_0_13 == false and ((string.find)(l_0_10, "\\\000m\000s\000m\000p\000e\000n\000g\000.\000e\000x\000e\000", l_0_12, true) or (string.find)(l_0_10, "\\\000m\000s\000s\000e\000n\000s\000e\000.\000e\000x\000e\000", l_0_12, true) or (string.find)(l_0_10, "\\\000s\000e\000n\000s\000e\000i\000r\000.\000e\000x\000e\000", l_0_12, true) or (string.find)(l_0_10, "\\\000s\000e\000n\000s\000e\000n\000d\000r\000.\000e\000x\000e\000", l_0_12, true) or (string.find)(l_0_10, "\\\000s\000e\000n\000s\000e\000c\000n\000c\000p\000r\000o\000x\000y\000.\000e\000x\000e\000", l_0_12, true) or (string.find)(l_0_10, "\\\000s\000e\000n\000s\000e\000s\000a\000m\000p\000l\000e\000u\000p\000l\000o\000a\000d\000e\000r\000.\000e\000x\000e\000", l_0_12, true)) then
                (MpDetection.ReportResource)("regkeyvalue", l_0_1 .. "\\\\" .. l_0_8, 9050, false)
              end
            end
          end
        end
      end
    end
  end
end

