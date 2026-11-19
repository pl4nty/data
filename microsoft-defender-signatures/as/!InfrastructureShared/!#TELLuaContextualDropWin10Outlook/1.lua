-- Threat: !InfrastructureShared
-- Name: !#TEL:LuaContextualDropWin10Outlook
-- Type: 13
-- Includes: GetEmailPaths

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1:find("win10%w+%.") ~= nil then
    local l_0_2 = {
      [".cpl"] = "",
      [".exe"] = "",
      [".scr"] = "",
      [".pif"] = "",
      [".zip"] = "",
      [".rar"] = "",
      [".vbs"] = "",
      [".vbe"] = "",
      [".jse"] = ""
    }
    if l_0_2[string.sub(l_0_1, -4)] and isOutlookProcess() then
      mp.set_mpattribute("TEL:LuaContextualDropWin10Outlook")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
