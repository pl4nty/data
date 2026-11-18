-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:ContextualDropPossibleRansomExe.B!fdr
-- Type: 9
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  if not peattributes.isexe then
    return mp.CLEAN
  end
  if peattributes.isdriver == true then
    return mp.CLEAN
  end
  if peattributes.no_security == false or peattributes.no_exports == false then
    return mp.CLEAN
  end
  local l_0_0 = mp.getfilesize()
  local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
  if 32768 <= l_0_0 and l_0_0 <= 524288 then
    if l_0_1:find("\\temp\\", 1, true) == nil and l_0_1:find("\\desktop\\", 1, true) == nil and l_0_1:find("\\downloads\\", 1, true) == nil then
      return mp.CLEAN
    end
    local l_0_3 = {
      ["pitupi20.exe"] = true,
      ["build.exe"] = true,
      ["rcfcngzxx.exe"] = true,
      ["galaperidol8.exe"] = true,
      ["bruhadson8.exe"] = true,
      ["miniramon8.exe"] = true
    }
    if l_0_3[l_0_2] or l_0_2:find("^skm_c%x+.exe$") then
      return mp.INFECTED
    end
  elseif 65536 <= l_0_0 and l_0_0 <= 196608 then
    if pevars.epsec ~= 1 or pehdr.NumberOfSections ~= 4 then
      return mp.CLEAN
    end
    if l_0_1:find("\\temp\\", 1, true) == nil and l_0_1:find("\\downloads\\", 1, true) == nil then
      return mp.CLEAN
    end
    if l_0_2:find("^chrome font[ %w%.]*%.exe$") ~= nil or l_0_2:find("^%d%d%d%d%d%d%-%d%d%d%d%d%d%d%d%d%d%.exe$") ~= nil or l_0_2:find("^%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.exe$") ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
