-- Threat: !InfrastructureShared
-- Name: !#Lua:DelfException
-- Type: 10
-- MpAttributes: SIGATTR:DelphiFile & (HSTR:Win32/GUIException | HSTR:DelfCPLException)

if not peattributes.isexe then
  return mp.CLEAN
end
if pehdr.NumberOfSections == 10 and pesecs[2].Name == ".itext" and pevars.epsec == 2 then
  return mp.INFECTED
end
return mp.CLEAN
