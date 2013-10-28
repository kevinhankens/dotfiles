#include "communicate.h"

int main(int argc, char *argv[])
{
  QApplication app(argc, argv);

  Communicate window;

  window.setWindowTitle("Communicate");
  window.show();

  return app.exec();
}
