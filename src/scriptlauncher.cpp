#include "scriptlauncher.h"
#include    <QProcess>
ScriptLauncher::ScriptLauncher(QObject *parent) :
    QObject(parent),
    m_process(new QProcess(this))
{
}
void ScriptLauncher::launchScript()
{
    // m_process->start("/usr/bin/totem");
    m_process->start("/usr/bin/python /home/ysli/proj/remote-ui/Machineface/scripts/example.py");

}
