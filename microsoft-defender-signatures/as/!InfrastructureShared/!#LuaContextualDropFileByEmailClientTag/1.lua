-- Threat: !InfrastructureShared
-- Name: !#//Lua:ContextualDropFileByEmailClientTag
-- Type: 12
-- Includes: GetEmailPaths
-- MpAttributes: RPF:TopLevelFile & MpOnCloseNewlyCreatedHintRtpScan

if mp.SCANREASON_ONMODIFIEDHANDLECLOSE == mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  local l_0_1 = getCachePaths(l_0_0)
  if l_0_1 ~= nil then
    local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
    local l_0_4 = {
      [".pdf"] = true,
      [".doc"] = true,
      [".xls"] = true,
      [".rtf"] = true,
      [".docm"] = true,
      [".xlsm"] = true,
      [".ppam"] = true,
      [".pptm"] = true,
      [".ppsm"] = true,
      [".potm"] = true,
      [".xlsx"] = true,
      [".docx"] = true,
      [".xlsb"] = true,
      [".xltx"] = true,
      [".xltm"] = true,
      [".xlt"] = true,
      [".xlam"] = true,
      [".xla"] = true,
      [".dotx"] = true,
      [".dotm"] = true,
      [".odt"] = true,
      [".pptx"] = true,
      [".pps"] = true,
      [".ppsx"] = true,
      [".jse"] = true,
      [".vbs"] = true,
      [".wsf"] = true,
      [".vbe"] = true,
      [".hta"] = true,
      [".js"] = true,
      [".mht"] = true,
      [".lnk"] = true,
      [".bat"] = true,
      [".ps1"] = true,
      [".zip"] = true,
      [".rar"] = true,
      [".7z"] = true,
      [".iso"] = true,
      [".arj"] = true,
      [".gz"] = true,
      [".ace"] = true,
      [".img"] = true,
      [".exe"] = true,
      [".scr"] = true,
      [".pif"] = true,
      [".htm"] = true,
      [".html"] = true,
      [".jar"] = true
    }
    local l_0_5, l_0_6, l_0_7
    for l_0_8, l_0_9 in pairs(l_0_1) do
      if l_0_2:find(l_0_9, 1, true) ~= nil then
        l_0_5 = string.sub(l_0_3, -3)
        l_0_6 = string.sub(l_0_3, -4)
        l_0_7 = string.sub(l_0_3, -5)
        if l_0_4[l_0_5] == true or l_0_4[l_0_6] == true or l_0_4[l_0_7] == true then
          MpCommon.AppendPersistContextNoPath("CLF_AM", "CLF_AM_EC", 60)
          if l_0_2:sub(1, 8) == "\\device\\" then
            l_0_2 = MpCommon.PathToWin32Path(l_0_2)
          end
          MpCommon.AppendPersistContextNoPath("CLF_IC", l_0_2 .. "\\" .. l_0_3, 60)
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
