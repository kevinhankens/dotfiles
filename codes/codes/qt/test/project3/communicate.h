#ifndef COMMUNICATE_H
#define COMMUNICATE_H

#include <QWidget>
#include <QApplication>
#include <QPushButton>
#include <QLabel>

class Communicate : public QWidget
{
  Q_OBJECT

  public:
    Communicate(QWidget *parent = 0);


  private slots:
    void OnPlus();
    void OnMinus();

  private:
    QLabel *label;

};

#endif
