# SystemRDL notes

## Component types

| Type          | Keyword      |
| ------------- | ------------ |
| Field         | `field`      |
| Register      | `reg`        |
| Register file | `regfile`    |
| Address map   | `addrmap`    |
| Signal        | `signal`     |
| Enumeration   | `enum`       |
| Memory        | `mem`        |
| Constraint    | `constraint` |

## Defining Components

SystemRDL components can be defined in two ways: definitively or anonymously.

- _Definitive_ defines a named component type, which is instantiated in a
  separate statement. The definitive definition is suitable for reuse.

- _Anonymous_ defines an unnamed component type, which is instantiated in the
  same statement. The anonymous definition is suitable for components that are
  used once.

The following code fragment shows a simple definitive field component definition
for myField.

```plain
field myField {};
```

The following code fragment shows a simple anonymous field component definition
for myField.

```plain
field {} myField;
```

## Address allocation operators

When instantiating regs, regfiles, mems, or addrmaps, the address may be
assigned using one of the address allocation operators.

| Property        | Implemetation/Application                                                                                                                                                                                                            |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `@ expression`  | Specifies the address for the component instance. This expression resolves to a longint unsigned.                                                                                                                                    |
| `+= expression` | Specifies the address stride when instantiating an array of components (controls the spacing of the components). The address stride is relative to the previous instance’s address. This expression resolves to a `longint unsigned` |

## Universal properties

The `name` and `desc` properties can be used to add descriptive information to
the SystemRDL code. The use of these properties encourages creating descriptions
that help generate rich documentation. All components have a instance name
already specified in SystemRDL; `name` can provide a more descriptive name
and `desc` can specify detailed documentation for that component.

| Property | Implemetation/Application                                       | Type     |
| -------- | --------------------------------------------------------------- | -------- |
| `name`   | Specifies a more descriptive name (for documentation purposes). | _string_ |
| `desc`   | Describes the component’s purpose.                              | _string_ |

| Reserved word |     |
| ------------- | --- |
| `regwidth`    |     |
