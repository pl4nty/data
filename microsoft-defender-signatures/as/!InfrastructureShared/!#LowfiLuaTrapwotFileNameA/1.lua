-- Threat: !InfrastructureShared
-- Name: !#Lowfi:Lua:TrapwotFileName.A
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  local l_0_2 = string.sub(l_0_1, -4)
  if (l_0_2 == ".exe" or l_0_2 == ".vbs") and l_0_1:match("^install_flashplayer%d%dx%d%dax_ver[%d%.]+sd_update") then
    if mp.get_mpattribute("SIGATTR:VirTool:Win32/OwnProcessWriteProcMem") then
      mp.set_mpattribute("Lowfi:Lua:TrapwotFilenameAndObfus")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
