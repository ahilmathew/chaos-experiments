# Chaos Experiments
This repository 3 scripts that help in performing 3 different chaos experiments.
* **Filling up a partition** in disk using the `manage_space.sh` script.
* **Creating high CPU load** on the cores using the `cpu_stress.sh` script.
* **Delaying traffic on an interface** using the `traffic_control.sh` script.

## `manage_space.sh`
---

This script needs to run as a user that has `sudo` access.

---
### How to fill up space?

```bash
$ ./manage_space.sh fill <partition> <percentage_to_fill>
```
### How to free up space?

```bash
$ ./manage_space.sh cleanup <partition>
```

## `cpu_stress.sh`

### How to stress cpu cores?

```bash
$ ./cpu_stress.sh stress <number_of_cores_to_stress>
```
### How to free up cores?

```bash
$ ./cpu_stress.sh free
```

## `traffic_control.sh`
---

This script needs to run as a user that has `sudo` access.

---

### How to add delay to an interface?

```bash
$ ./traffic_control.sh start <delay_in_milliseconds> <interface_name>
```

### How to remove delay from an interface?

```bash
$ ./traffic_control.sh stop <interface_name>
```