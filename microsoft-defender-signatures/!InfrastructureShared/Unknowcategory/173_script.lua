-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\173_luac 

-- params : ...
-- function num : 0
local l_0_7, l_0_10, l_0_14, l_0_18 = nil, nil
do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p1)
  else
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
      local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_9, l_0_13, l_0_15, l_0_16, l_0_17 = (string.lower)((this_sigattrlog[2]).utf8p1)
    else
    end
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

    do
      if (not (this_sigattrlog[4]).matched or (string.lower)((this_sigattrlog[4]).utf8p1) ~= nil) and (sysio.IsFileExists)((string.lower)((this_sigattrlog[4]).utf8p1)) and ((sysio.GetFileSize)((string.lower)((this_sigattrlog[4]).utf8p1)) <= 8192 or not 8192) then
        local l_0_12 = nil
      end
      if (string.match)(tostring((sysio.ReadFile)((string.lower)((this_sigattrlog[4]).utf8p1), 0, (sysio.GetFileSize)((string.lower)((this_sigattrlog[4]).utf8p1)))), "assembly=\"(App_Web_[^\"]+)\"") == nil then
        return mp.CLEAN
      end
      local l_0_19, l_0_20, l_0_21, l_0_22 = , nil, nil
      local l_0_23 = nil
      if ((string.match)(l_0_19, "\\([^\\]+)$") == nil or l_0_21 ~= nil) and (sysio.IsFileExists)(l_0_21) and ((sysio.GetFileSize)(l_0_21) <= 8192 or not 8192) then
        local l_0_26 = nil
        l_0_26 = (string.match)(tostring((sysio.ReadFile)(l_0_21, 0, (sysio.GetFileSize)(l_0_21))), "#ExternalChecksum%(\"([^\"]+)")
      else
        do
          if l_0_22 ~= nil and (sysio.IsFileExists)(l_0_22) and ((sysio.GetFileSize)(l_0_22) <= 8192 or not 8192) then
            local l_0_29 = nil
            l_0_29 = (string.match)(tostring((sysio.ReadFile)(l_0_22, 0, (sysio.GetFileSize)(l_0_22))), "#pragma checksum \"([^\"]+)")
          else
            do
              do
                if l_0_23 ~= nil and (sysio.IsFileExists)(l_0_23) and ((sysio.GetFileSize)(l_0_23) <= 12288 or not 12288) then
                  local l_0_32 = nil
                  l_0_32 = (string.match)(tostring((sysio.ReadFile)(l_0_23, 0, (sysio.GetFileSize)(l_0_23))), "//@set @position%(file=\"([^\"]+%.as[hp]x)\"")
                  l_0_32 = (string.gsub)(l_0_32, "\\\\", "\\")
                end
                -- DECOMPILER ERROR at PC224: Confused about usage of register: R5 in 'UnsetPending'

                -- DECOMPILER ERROR at PC228: Confused about usage of register: R5 in 'UnsetPending'

                -- DECOMPILER ERROR at PC234: Confused about usage of register: R5 in 'UnsetPending'

                if l_0_32 and (sysio.IsFileExists)(l_0_32) then
                  local l_0_33 = nil
                  local l_0_34 = nil
                  if (string.find)("|.asp|aspx|ashx|asmx|", (string.sub)(l_0_32, -4), 1, true) ~= nil and ((sysio.GetFileSize)(l_0_33) <= 512 or not 512) then
                    local l_0_37 = nil
                    local l_0_38, l_0_39 = nil
                    if (MpCommon.StringRegExpSearch)("(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler)", tostring((sysio.ReadFile)(l_0_33, 0, (sysio.GetFileSize)(l_0_33)))) then
                      return mp.CLEAN
                    end
                    local l_0_40 = nil
                    if (string.match)(l_0_33, "(.*\\)[^\\]+$") then
                      (bm.add_related_string)("webshellpaths", (string.match)(l_0_33, "(.*\\)[^\\]+$"), bm.RelatedStringBMReport)
                    end
                    ;
                    (mp.ReportLowfi)(l_0_33, 2714789737)
                    return mp.INFECTED
                  end
                end
                do
                  return mp.CLEAN
                end
              end
            end
          end
        end
      end
    end
  end
end

