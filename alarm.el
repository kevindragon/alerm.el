;;; alarm.el --- Alarm

;; Copyright (C) 2017, Emacs guys, all rights reserved.

;; Author: Kevim Jiang <wenlin1988@126.com>
;; Version: 0.0.1
;; Maintainer: Kevin Jaing <wenlin1988@126.com>
;; Created: 2017-07-24 12:00:00
;; Keywords: Alarm

;;; Commentary:

;; This is Commentary

(defvar alarm-clock-timer nil
  "Keep timer so that the user can cancel the alerm.")

(defun alarm-ding3 ()
  "Play 3 times ding."
  (dotimes (n 3)
    (play-sound-file "alarm.wav")))

(defun alarm-clock-cancel ()
  "Cancel the alarm clock."
  (interactive)
  (cancel-timer alarm-clock-timer))

(defun alarm-clock ()
  "Set an alarm.
The time format is the same accepted by `run-at-time'. 
For example 12:00am."
  (interactive)
  (let ((time (read-string "Time(example, 12:00am): ")))
    (setq alarm-clock-timer (run-at-time time nil 'alarm-ding3))))

(provide 'alarm)

;;; alarm.el ends here
